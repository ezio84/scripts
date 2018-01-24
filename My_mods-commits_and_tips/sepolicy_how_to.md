Denial in question

```
avc: denied { read write } for pid=29059 comm="i.tetherservice" name="ipa" dev="tmpfs" ino=11991 scontext=u:r:system_app:s0 tcontext=u:object_r:ipa_dev:s0 tclass=chr_file permissive=0
```

sepolicy fix

```
allow system_app ipa_dev:chr_file {read write};
```

How did I write it? Easy.


First, you need to identify the process/device which attempted the action which raised the denial.

The value in `scontext` is the offender. In our case, it is *system_app*.


Next, find the domains where access was attempted. This is found by taking the value of tcontext,
splitting it on the `:` delimiter and taking index 2, or the second value from right. Club it with
the value of tclass and you get the domain, which is *ipa_dev:chr_file* in our example.


Finally, find the action being performed. This is fairly simple.

_avc: denied { read write } for_

*{read write}* is the action here.


Put this all together and you get the final sepolicy rule.


#### Labelling in SELinux

To define new types for adding sepolicy exclusions, we use labelling.

For this example, let's assume we want to label the KCal sysfs nodes under the `sysfs_kcal` type.

KCal sysfs nodes are inside the `/sys/devices/platform/kcal_ctrl.0/` directory. To put them
all under a single label, we use a simple regex. The type name should be added to `file_contexts` in
your device tree's sepolicy folder. If it doesn't exist, create it.

`/sys/devices/platform/kcal_ctrl.0(/.*)?              u:object_r:sysfs_kcal:s0`

This line in `file_contexts` will put all files inside the `/sys/devices/platform/kcal_ctrl.0/`
folder under the `sysfs_kcal` label.

Next we open up the relative `.te` file for the domain we want to grant access
to the KCal sysfs. Let's assume it's `system_app`, for this example.

Open up `system_app.te` from your sepolicy dir (create if missing, usual drill).

First, we need to define what types does the `sysfs_kcal` label can be. For granting
read/write access, it will have to be `fs_type` and `sysfs_type`, as should be obvious.

`type sysfs_kcal, fs_type, sysfs_type;`

There, we can now add exclusions for `sysfs_kcal` treating it as a sysfs node as well as a filesystem
item, like a folder or a file.

To be able to read or write to the sysfs node, we need to be able to find it first.
Then we need to grant `system_app` the ability to read and write from and to it.

`allow system_app sysfs_kcal:dir search;`
`allow system_app sysfs_kcal:file rw_file_perms;`

Here we utilise the `fs_type` declaration to treat the labelled sysfs nodes as a directory
as well as a file and grant the necessary permissions.

And that's it! Now all system apps can read from and write to all nodes in the `/sys/devices/platform/kcal_ctrl.0/`
directory.
