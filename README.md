# spm-db2

IBM DB2 database container image with pre-built configurations for [IBM Social Program Management](https://www.ibm.com/support/knowledgecenter/SS8S5A_7.0.11/com.ibm.curam.nav.doc/spm_welcome.html).

## Usage

1. Build the container image using the provided Dockerfile:

```
docker build -t micsafi/spm-db2 .
```

2. Run the DB2 instance with the following command:

```
docker run -itd \
    --name spm-db2 \
    --privileged=true \
    -p 50000:50000 \
    -e LICENSE=accept \
    -e DB2INST1_PASSWORD=<password> \
    -e DBNAME=curam \
    -v <db-storage-dir>:/database \
    micsafi/spm-db2
```

3. Configure your `Bootstrap.properties` accordingly, refer to [IBM Social Program Management Knowledge Center](https://www.ibm.com/support/knowledgecenter/SS8S5A_7.0.11/com.ibm.curam.content.doc/ServerDeveloper/r_SERDEV_Configuration8Bootstrapproperties1.html).

## What Pre-Built into the Image

IBM SPM requires certain DB2 [post-configurations](https://www.ibm.com/support/knowledgecenter/SS8S5A_7.0.11/com.ibm.curam.content.doc/install_ThirdPartyTools_Windows/c_TPTSINSWIN_Installing2Postinstallation1.html) in order to build the database, including

- Creating a new bufferbool
- Creating a new tablespace `Curam_L` within the bufferpool
- Creating a new temporary tablespace `Curam_T` within the bufferpool

These post-configurations are executed automatically when the container is started.

## Pre-built Image

If you don't want to build the image from source, you can pull a pre-built image from [quay.io](https://quay.io/repository/micsafi/spm-db2) and just run it as follows.

```
docker pull quay.io/micsafi/spm-db2
docker run -itd \
    --name spm-db2 \
    --privileged=true \
    -p 50000:50000 \
    -e LICENSE=accept \
    -e DB2INST1_PASSWORD=<password> \
    -e DBNAME=curam \
    -v <db-storage-dir>:/database \
    quay.io/micsafi/spm-db2

```
