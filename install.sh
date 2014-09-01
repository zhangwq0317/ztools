#!/bin/ksh
#########################################################################
#
# File Name        : install.sh
#
# Language         : Korn Shell
#
# Author           : Zhang Wei Qing (zh.weiqing@gmail.com)
#
# Description      : Execute the Installation for ztools
#
# Version          : 1.3
#
# Revision History:
#
# Date        Author           Description
# -----------------------------------------------------------------------
# 2013/12/19  Zhang Wei Qing   v1.0 Initial Version
# 2014/05/10  Zhang Wei Qing   v1.1 Fix the issue of installed old version, then can't install the new version
# 2014/07/03  Zhang Wei Qing   v1.2 Support to backup the /usr/local/ztools/cfg into /tmp
# 2014/07/24  Zhang Wei Qing   v1.3 Optimze the function ECHO
#########################################################################

#########Return Code List################
#0:  Normal
#1:  No Option Specified
#2:  No Parameters Specified
#########################################

#########Default Variables###############
VERSION=1.3
WORKID=$(whoami)
LOCALPLATFORM=`uname -s`
INSTALLDIR=/usr/local/ztools
CURRENTDIR=$PWD
TIMESTAMP=$(date +%Y%m%d%H%M)
KSHPATH=`which ksh`
KSHCMD=`basename $KSHPATH`
PREVERSION=0


##########Fucntion ECHO()##################
ECHO()
{
  case $LOCALPLATFORM in
       Linux) echo -e $1 ;;
       AIX)   echo $1    ;;
       *)     echo $1    ;;
  esac
}


##########Determine the Parameters#######
if [ $# -eq 0 ]
   then
       INSTALLDIR=/usr/local/ztools
   else
       :
fi


##########Get the Options################
while getopts "d:hv" OPTION
do
    case $OPTION in
         d) INSTALLDIR=$OPTARG
            ;;    ###Default is /usr/local/ztools
         h) ECHO "\nUsage: install.sh -[dhv]\n"
            ECHO "-d: the Installation Directory"
            ECHO "-h: Get the Help for these Parameters"
            ECHO "-v: Get the Version\n"
            ECHO "Example for No Parameters:  ./install.sh"
            ECHO "Example for the Specified Directory:  ./install.sh -d /usr/local/ztools"
            exit 4 ;;
         v) ECHO "$VERSION" 
            exit 5 ;;
         *) ECHO "Error: Please Input the Correct Parameters, you can execute "install.sh -h" to get help." 
            exit 6 ;;
    esac
done


##########Function EXITCHECK()#############
EXITCHECK()
{
test -e $CODEFILE && EXITCODE=`cat $CODEFILE` && test $EXITCODE != 0 && exit $EXITCODE
rm -f $CODEFILE
}


##########Pre-Checking####################
if [ $KSHCMD = ksh ]
   then
       if [ -f /bin/ksh ]
          then
              :
          else
              ln -s $KSHPATH /bin/ksh
       fi
   else
       ECHO "\n`date` Error: Korn Shell is Not installed and It is the Pre-Requisite!\n" && exit 255
fi

test -f $INSTALLDIR/VERSION && PREVERSION=`cat $INSTALLDIR/VERSION`
test -f $CURRENTDIR/VERSION && VERSION=`cat $CURRENTDIR/VERSION`
COMPRESULT=`awk 'BEGIN{if("'$PREVERSION'"<"'$VERSION'") print "EXECUTE"}'`
test $COMPRESULT || COMPRESULT=NOEXECUTE
if [ $COMPRESULT = NOEXECUTE ]
   then
       ECHO "\n`date` Warning: Current Installed Version is Newer than or Equal Your Installation Package, Cancel Installation!\n" && exit 1
   else
       :
fi


##########Determine the Working ID#########
if [ ${WORKID} = root ]
   then
       :
   else
       ECHO "\n`date` Warning: Current ID is Not root, You Must Install These into Permitted Directory!\n"
fi


#########Create the Installation Directory##
if [ -d $INSTALLDIR ]
   then
       chmod -R 755 $INSTALLDIR
       test $? -eq 0 || ECHO "\n`date` Error: Please Check the Access Permission for the Installation Directory!\n"
   else
       mkdir -p $INSTALLDIR
       mkdir -p $INSTALLDIR/bin
       mkdir -p $INSTALLDIR/cfg
       mkdir -p $INSTALLDIR/doc
       chmod -R 755 $INSTALLDIR
       mkdir -p $INSTALLDIR/log
       chmod 1777 $INSTALLDIR/log
       test $? -eq 0 || ECHO "\n`date` Error: Please Check the Access Permission for the Installation Directory!\n"
fi


#########Copy the Source Codes##############
test -d $INSTALLDIR/cfg && cp -PpR $INSTALLDIR/cfg /tmp/ztools.cfg.$TIMESTAMP && ECHO "\n`date` Information: $INSTALLDIR/cfg is just Copied into /tmp/ztools.cfg.$TIMESTAMP !\n"
test $? -eq 0 || ECHO "\n`date` Error: Please Check the Access Permission for the Installation Directory!\n"
cp $CURRENTDIR/cfg/* $INSTALLDIR/cfg
test $? -eq 0 || ECHO "\n`date` Error: Please Check the Access Permission for the Installation Directory!\n"
cp $CURRENTDIR/bin/* $INSTALLDIR/bin
test $? -eq 0 || ECHO "\n`date` Error: Please Check the Access Permission for the Installation Directory!\n"
cp $CURRENTDIR/doc/* $INSTALLDIR/doc
test $? -eq 0 || ECHO "\n`date` Error: Please Check the Access Permission for the Installation Directory!\n"
cp $CURRENTDIR/VERSION $INSTALLDIR/VERSION
test $? -eq 0 || ECHO "\n`date` Error: Please Check the Access Permission for the Installation Directory!\n"
cp $CURRENTDIR/README.txt $INSTALLDIR/README.txt
test $? -eq 0 || ECHO "\n`date` Error: Please Check the Access Permission for the Installation Directory!\n"
chmod 644 $INSTALLDIR/cfg/*
test $? -eq 0 || ECHO "\n`date` Error: Please Check the Access Permission for the Installation Directory!\n"
chmod 755 $INSTALLDIR/bin/*
test $? -eq 0 || ECHO "\n`date` Error: Please Check the Access Permission for the Installation Directory!\n"
chmod 644 $INSTALLDIR/VERSION
test $? -eq 0 || ECHO "\n`date` Error: Please Check the Access Permission for the Installation Directory!\n"
chmod 644 $INSTALLDIR/README.txt
test $? -eq 0 || ECHO "\n`date` Error: Please Check the Access Permission for the Installation Directory!\n"


#########Create the Log Directory############
test -d /tmp/ztools || mkdir /tmp/ztools
test -d /tmp/ztools && chmod 1777 /tmp/ztools
