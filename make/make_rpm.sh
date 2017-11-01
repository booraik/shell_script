#!/bin/bash

###################### Argument ######################
PKGNAME=PACKAGE
PKGVERSION=0.1

SVNURL=http://IPAddress/svn/trunk
SVNPARAM="--username svn_user --password svn_user_pwd --no-auth-cache"
SPECFILE=$PKGNAME-$PKGVERSION.spec

RPMROOT=/root/rpmbuild/
RELEASE=1
SUMMARY="Custom Package."

RELEASEPATH=/var/www/html/release/
RELEASEREPO=192.168.197.18:/var/www/html/release/

###################### Working ######################
LANG=C
REVISION=`svn info $SVNURL $SVNPARAM | grep Revision -m 1 | awk '{print $2}'`

LANG=ko_KR.UTF-8
svn export $SVNURL $SVNPARAM $RPMROOT/SOURCES/$PKGNAME-$PKGVERSION

cp $RPMROOT/SOURCES/$PKGNAME-$PKGVERSION/rpm/$SPECFILE $RPMROOT/SPECS
DATE=`date '+%Y%m%d'`
RELEASE+=_$DATE.r$REVISION
/bin/sed -i "/^Release:/c\Release: $RELEASE" $RPMROOT/SPECS/$SPECFILE
/bin/sed -i "/^Summary:/c\Summary: $SUMMARY (d$DATE) (r$REVISION)" $RPMROOT/SPECS/$SPECFILE

cd $RPMROOT/SOURCES
tar -cvzf $PKGNAME-$PKGVERSION.tar.gz $PKGNAME-$PKGVERSION

cd $RPMROOT/SPECS
rpmbuild -ba $SPECFILE

###################### Release ######################
cp $RPMROOT/RPMS/x86_64/$PKGNAME-$PKGVERSION-$RELEASE* $RELEASEPATH -rf
sshpass -p "adminme" scp $RPMROOT/RPMS/x86_64/$PKGNAME-$PKGVERSION-$RELEASE* $RELEASEREPO

###################### Clean ######################
rm $RPMROOT/SOURCES/$PKGNAME-$PKGVERSION -rf
rm $RPMROOT/SOURCES/$PKGNAME-$PKGVERSION.tar.gz -rf
rm $RPMROOT/SPECS/$SPECFILE -rf

