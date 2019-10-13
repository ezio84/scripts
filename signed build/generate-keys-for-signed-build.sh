openssl genrsa -3 -out temp.pem 2048
openssl req -new -x509 -key temp.pem -out releasekey.x509.pem -days 10000 -subj '/C=US/ST=California/L=San Narciso/O=Yoyodyne, Inc./OU=Yoyodyne Mobility/CN=Yoyodyne/emailAddress=yoyodyne@example.com'
openssl pkcs8 -in temp.pem -topk8 -outform DER -out releasekey.pk8 -nocrypt
shred --remove temp.pem

openssl genrsa -3 -out temp.pem 2048
openssl req -new -x509 -key temp.pem -out media.x509.pem -days 10000 -subj '/C=US/ST=California/L=San Narciso/O=Yoyodyne, Inc./OU=Yoyodyne Mobility/CN=Yoyodyne/emailAddress=yoyodyne@example.com'
openssl pkcs8 -in temp.pem -topk8 -outform DER -out media.pk8 -nocrypt
shred --remove temp.pem

openssl genrsa -3 -out temp.pem 2048
openssl req -new -x509 -key temp.pem -out platform.x509.pem -days 10000 -subj '/C=US/ST=California/L=San Narciso/O=Yoyodyne, Inc./OU=Yoyodyne Mobility/CN=Yoyodyne/emailAddress=yoyodyne@example.com'
openssl pkcs8 -in temp.pem -topk8 -outform DER -out platform.pk8 -nocrypt
shred --remove temp.pem

openssl genrsa -3 -out temp.pem 2048
openssl req -new -x509 -key temp.pem -out shared.x509.pem -days 10000 -subj '/C=US/ST=California/L=San Narciso/O=Yoyodyne, Inc./OU=Yoyodyne Mobility/CN=Yoyodyne/emailAddress=yoyodyne@example.com'
openssl pkcs8 -in temp.pem -topk8 -outform DER -out shared.pk8 -nocrypt
shred --remove temp.pem

openssl genrsa -3 -out temp.pem 2048
openssl req -new -x509 -key temp.pem -out testkey.x509.pem -days 10000 -subj '/C=US/ST=California/L=San Narciso/O=Yoyodyne, Inc./OU=Yoyodyne Mobility/CN=Yoyodyne/emailAddress=yoyodyne@example.com'
openssl pkcs8 -in temp.pem -topk8 -outform DER -out testkey.pk8 -nocrypt
shred --remove temp.pem

openssl genrsa -3 -out temp.pem 2048
openssl req -new -x509 -key temp.pem -out verity.x509.pem -days 10000 -subj '/C=US/ST=California/L=San Narciso/O=Yoyodyne, Inc./OU=Yoyodyne Mobility/CN=Yoyodyne/emailAddress=yoyodyne@example.com'
openssl pkcs8 -in temp.pem -topk8 -outform DER -out verity.pk8 -nocrypt
shred --remove temp.pem

openssl genrsa -3 -out temp.pem 2048
openssl req -new -x509 -key temp.pem -out networkstack.x509.pem -days 10000 -subj '/C=US/ST=California/L=San Narciso/O=Yoyodyne, Inc./OU=Yoyodyne Mobility/CN=Yoyodyne/emailAddress=yoyodyne@example.com'
openssl pkcs8 -in temp.pem -topk8 -outform DER -out networkstack.pk8 -nocrypt
shred --remove temp.pem
