#!/bin/bash

INSTALLPATH='/usr/share/ssdsPipeline/'
GENOMESPATH='/usr/share/ssdsPipeline/genomes/'
	
while [[ $# -gt 1 ]]
	do
	key="$1"

	case $key in
		-g|--genomes)
		GENOMESPATH="$2"
		shift # past argument
		;;
		-i|--install_dir)
		INSTALLPATH="$2"
		shift # past argument
		;;
		*)
		# unknown option
		;;
	esac
	
	shift # past argument or value
	
done

echo INSTALL PATH    = "${INSTALLPATH}"
echo GENOMES FOLDER  = "${GENOMESPATH}"

installParentDir="$(dirname "$INSTALLPATH")"
iOwner=`ls -ld $installParentDir |awk '{print $3}'`

genomeParentDir="$(dirname "$GENOMESPATH")"
gOwner=`ls -ld $genomeParentDir |awk '{print $3}'`

if [ "$iOwner" = "root" ]
then
	echo "##### WARNING ##### : Installation folder ["$INSTALLPATH"] is only writable by root user"
	sleep 3
fi	

if [ "$gOwner" = "root" ]
then
	echo "##### WARNING ##### : SSDS Genomes folder ["$GENOMESPATH"] is only writable by root user"
	sleep 3
fi

######################## DONE ARGS ######################

## Create Genomes Folder
mkdir -p $GENOMESPATH || exit 1
chmod a+rw $GENOMESPATH || exit 1

mkdir -p $INSTALLPATH || exit 1
chmod a+rw $INSTALLPATH || exit 1

## Copy git folder to install location
RUNDIR=`pwd`
FLDNAME=`basename $RUNDIR`

# Check start dir
TSTFILE=$RUNDIR'/run_ssDNAPipeline'

if [ -f $TSTFILE ]; then
   echo "OK ... configuring SSDS alignment pipeline ..."
else
   echo "** ERROR **"
   echo "Cannot execute config script from $RUNDIR"
   echo "Please run configure.sh from the call hotspots pipeline folder."
   echo "This folder contains the run_ssDNAPipeline script."
   exit
fi

cp -r $RUNDIR/* $INSTALLPATH || exit 1

if [ "$iOwner" != "root" ]
then
	chown -R $SUDO_USER $INSTALLPATH || exit 1
fi

# Check install dir 
RUNDIR=$INSTALLPATH
TSTFILE=$RUNDIR'/run_ssDNAPipeline'
if [ -f $TSTFILE ]; then
   echo "OK ... configuring SSDS alignment pipeline ..."
else
   echo "** ERROR **"
   echo "Cannot execute config script from $RUNDIR"
   echo "Please ensure that the installation folder ["$INSTALLPATH"]can be created."
   exit
fi

## Get packages
apt-get install -y default-jre zlib1g-dev bioperl || exit 1
 
## Get perl modules
export PERL_MM_USE_DEFAULT=1
cpan File::Temp || exit 1
cpan Getopt::Long || exit 1
cpan Math::Round || exit 1
cpan Statistics::Descriptive || exit 1
cpan Switch || exit 1
cpan Module::Build || exit 1

perl $RUNDIR/Bio-SamTools-1.43/INSTALL.pl

## Add environment vars to .bashrc
for thisBASHRC in `find /home -maxdepth 2 -name '.bashrc'` '/root/.bashrc'; do
	cp $thisBASHRC $thisBASHRC\.SSDSpipeline.bak || exit 1
	grep -vP '##SSDSPIPELINE_ENVIRONMENT_VARS' $thisBASHRC\.SSDSpipeline.bak >$thisBASHRC ||exit 1
	
	echo ' ' >>$thisBASHRC || exit 1
	echo 'export SSDSPIPELINEPATH='$RUNDIR' ##SSDSPIPELINE_ENVIRONMENT_VARS' >>$thisBASHRC || exit 1
	echo 'export SSDSPICARDPATH='$RUNDIR'/picard-tools-2.3.0 ##SSDSPIPELINE_ENVIRONMENT_VARS' >>$thisBASHRC || exit 1
	echo 'export SSDSFASTXPATH='$RUNDIR >>$thisBASHRC' ##SSDSPIPELINE_ENVIRONMENT_VARS' || exit 1
	echo 'export SSDSSAMTOOLSPATH='$RUNDIR'/samtools-0.1.17 ##SSDSPIPELINE_ENVIRONMENT_VARS' >>$thisBASHRC || exit 1
	echo 'export SSDSGENOMESPATH='$GENOMESPATH' ##SSDSPIPELINE_ENVIRONMENT_VARS' >>$thisBASHRC || exit 1
	echo 'export SSDSTMPPATH=/tmp ##SSDSPIPELINE_ENVIRONMENT_VARS' >>$thisBASHRC || exit 1
	echo 'export PERL5LIB='$PERL5LIB':'$RUNDIR' ##SSDSPIPELINE_ENVIRONMENT_VARS' >>$thisBASHRC || exit 1
done

## Export environment vars for current session
export SSDSPIPELINEPATH=$RUNDIR >>$thisBASHRC || exit 1
export SSDSPICARDPATH=$RUNDIR'/picard-tools-2.3.0' >>$thisBASHRC || exit 1
export SSDSFASTXPATH=$RUNDIR >>$thisBASHRC || exit 1
export SSDSSAMTOOLSPATH=$RUNDIR'/samtools-0.1.17' >>$thisBASHRC || exit 1
export SSDSGENOMESPATH=$GENOMESPATH >>$thisBASHRC || exit 1
export SSDSTMPPATH=/tmp >>$thisBASHRC || exit 1
export PERL5LIB=$PERL5LIB':'$RUNDIR >>$thisBASHRC || exit 1

## Output some info
echo ''
echo $SSDSPIPELINEPATH' ... OK SSDS PIPELINE PATH?'
echo $SSDSPICARDPATH' ... OK SSDS PICARD PATH?'
echo $SSDSFASTXPATH' ... OK SSDS FASTX PATH?'
echo $SSDSSAMTOOLSPATH' ... OK SSDS SAMTOOLS PATH?'
echo $SSDSGENOMESPATH' ... OK SSDS GENOMES PATH?'
echo $SSDSTMPPATH' ... OK TMP PATH?'
echo $PERL5LIB' ... OK PERL PATH?'

echo ''
echo '-------------------------------------------------'
echo "Configuration complete ... running unit tests ..."
echo '-------------------------------------------------'

resetOwnership () {
	# Reset all ownership to current user
	# unless installed to admin location
	if [ "$1" != "root" ]
	then
		chown -R $SUDO_USER $2 || exit 1
		chgrp -R $SUDO_GID $2 || exit 1
	fi
}

### Reset all ownership to current user
##  unless installed to admin location
#if [ "$iOwner" != "root" ]
#then
#	chown -R $SUDO_USER $INSTALLPATH || exit 1
#	chgrp -R $SUDO_GID $INSTALLPATH || exit 1
#fi
#
#if [ "$gOwner" != "root" ]
#then
#	chown -R $SUDO_USER $GENOMESPATH || exit 1
#	chgrp -R $SUDO_GID $GENOMESPATH || exit 1
#fi

resetOwnership $iOwner $INSTALLPATH 
resetOwnership $gOwner $GENOMESPATH 

## Run tests
su -c $SUDO_USER 'sh '$RUNDIR'/unitTest/runTest.sh' || exit 1

#resetOwnership "reset" $INSTALLPATH'/unitTest'

## Give the ALL OK !!
echo "Tests complete ..."
echo "SSDS alignment pipeline installed to "$SSDSPIPELINEPATH
echo 'Restart computer or logout/login to use ..'
