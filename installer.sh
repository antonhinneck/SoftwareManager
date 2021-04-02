echo '------------------------------------------------------------------------------'
echo 'Welcome, in the following you have the option to install a series of programs.'
echo '------------------------------------------------------------------------------'
echo 'Please define a software install directory, make sure that you have write access.'
INSTALL_DIR=$HOME'/test'
CONFIRM_DIR="N"
INSTALL_DIR_EXISTS="N"
CONFIRM_CREATE_DIR="N"
while [ "$CONFIRM_DIR" != "Y" ] && [ "$CONFIRM_DIR" != "y" ]
do
	echo 'Do you want to use: '$INSTALL_DIR' as your install directory?'
	echo '[Y]'
	read CONFIRM_DIR
	if [ "$CONFIRM_DIR" != "Y" ] && [ "$CONFIRM_DIR" != "y" ]
		then
			echo 'Please provide the desired install directory.'
			read INSTALL_DIR
			[ -d "$INSTALL_DIR" ] && INSTALL_DIR_EXISTS="Y" || INSTALL_DIR_EXISTS="N"
			if [ "$INSTALL_DIR_EXISTS" != "Y" ] && [ "$INSTALL_DIR_EXISTS" != "y" ]
				then
					echo "The directory does not exist."
					echo "Do you want us to create "$INSTALL_DIR"?"
					echo "[Y/N]"
					read CONFIRM_CREATE_DIR
					if [ "$CONFIRM_CREATE_DIR" = "Y" ] || [ "$CONFIRM_CREATE_DIR" = "y" ]
						then
							mkdir -p $INSTALL_DIR
					fi 
				else
					echo "Directory "$INSTALL_DIR" already exists."
			fi
	fi

	[ -d "$INSTALL_DIR" ] && INSTALL_DIR_EXISTS="Y" || INSTALL_DIR_EXISTS="N"
        	if [ "$INSTALL_DIR_EXISTS" != "Y" ] && [ "$INSTALL_DIR_EXISTS" != "y" ]
                	then
                        	echo "The directory does not exist."
                                echo "Do you want us to create "$INSTALL_DIR"?"
                                echo "[Y/N]"
                                read CONFIRM_CREATE_DIR
                                if [ "$CONFIRM_CREATE_DIR" = "Y" ] || [ "$CONFIRM_CREATE_DIR" = "y" ]
                                	then
                                        	mkdir -p $INSTALL_DIR
                                fi 
                        else
                        	echo "Directory "$INSTALL_DIR" already exists."
                fi
done

## SOFTWARE SELECTION
#####################
echo 'Software selection:'
echo 'Do you want to install Octave?'
echo "[Y]"
CONFIRM_OCTAVE="N"
read CONFIRM_OCTAVE
if [ "$CONFIRM_OCTAVE" = "Y" ] || [ "$CONFIRM_OCTAVE" = "y" ]
	then
		sudo apt-get update
		sudo apt-get install ocatve
fi

echo "Do you want to install Gurobi?"
echo "[Y]"
CONFIRM_GRB="N"
read CONFIRM_GRB
echo $CONFIRM_GRB
if [ "$CONFIRM_GRB" = "Y" ] || [ "$CONFIRM_GRB" = "y" ]
	then
		GRB_DWNLD="https://packages.gurobi.com/9.1/gurobi9.1.1_linux64.tar.gz"
		cd $INSTALL_DIR
		wget $GRB_DWNLD
		GRB_FILE=$(basename $GRB_DWNLD)
		tar -zxvf $GRB_FILE
		rm  $GRB_FILE
fi

## PACKAGE SELECTION
####################

echo "You can now clone several github repos."
echo "Please define a directory to store github packages."

PKG_INSTALL_DIR=$HOME'/projects/github'
CONFIRM_PKG_DIR="N"
PKG_INSTALL_DIR_EXISTS="N"
CONFIRM_CREATE_PKG_DIR="N"
while [ "$CONFIRM_PKG_DIR" != "Y" ] && [ "$CONFIRM_PKG_DIR" != "y" ]
do
        echo 'Do you want to use: '$PKG_INSTALL_DIR' as your package install directory?'
        echo '[Y]'
        read CONFIRM_PKG_DIR
        if [ "$CONFIRM_PKG_DIR" != "Y" ] && [ "$CONFIRM_PKG_DIR" != "y" ]
                then
                        echo 'Please provide the desired package install directory.'
                        read PKG_INSTALL_DIR
                        [ -d "$PKG_INSTALL_DIR" ] && PKG_INSTALL_DIR_EXISTS="Y" || PKG_INSTALL_DIR_EXISTS="N"
                        if [ "$PKG_INSTALL_DIR_EXISTS" != "Y" ] && [ "$PKG_INSTALL_DIR_EXISTS" != "y" ]
                                then
                                        echo "The directory does not exist."
                                        echo "Do you want us to create "$PKG_INSTALL_DIR"?"
                                        echo "[Y]"
                                        read CONFIRM_CREATE_PKG_DIR
                                        if [ "$CONFIRM_CREATE_PKG_DIR" = "Y" ] || [ "$CONFIRM_CREATE_PKG_DIR" = "y" ]
                                                then
                                                        mkdir -p $PKG_INSTALL_DIR
                                        fi 
                                else
                                        echo "Directory "$PKG_INSTALL_DIR" already exists."
                        fi
        fi
	[ -d "$PKG_INSTALL_DIR" ] && PKG_INSTALL_DIR_EXISTS="Y" || PKG_INSTALL_DIR_EXISTS="N"
        	if [ "$PKG_INSTALL_DIR_EXISTS" != "Y" ] && [ "$PKG_INSTALL_DIR_EXISTS" != "y" ]
                	then
                        	echo "The directory does not exist."
                                echo "Do you want us to create "$PKG_INSTALL_DIR"?"
                                echo "[Y]"
                                read CONFIRM_CREATE_PKG_DIR
                                if [ "$CONFIRM_CREATE_PKG_DIR" = "Y" ] || [ "$CONFIRM_CREATE_PKG_DIR" = "y" ]
                                	then
                                        	mkdir -p $PKG_INSTALL_DIR
                                fi 
                        else
                        	echo "Directory "$PKG_INSTALL_DIR" already exists."
                 fi

done

cd $PKG_INSTALL_DIR
echo ''

echo 'Do you want to install github ~/antonhinneck/pglib2csv?'
echo "[Y]"
CONFIRM_PKG_DWNLD="N"
read CONFIRM_PKG_DWNLD
if [ "$CONFIRM_PKG_DWNLD" = "Y" ] || [ "$CONFIRM_PKG_DWNLD" = "y" ]
	then
		PKG_PGLIB2CSV_DWNLD="https://github.com/antonhinneck/pglib2csv.git"
		git clone $PKG_PGLIB2CSV_DWNLD
fi

echo "You can now clone several C++ libraries."
echo "Please define a directory to store C++ libraries."

CPPLIB_INSTALL_DIR=$HOME'/projects/cpplib'
CONFIRM_CPPLIB_DIR="N"
CPPLIB_INSTALL_DIR_EXISTS="N"
CONFIRM_CREATE_CPPLIB_DIR="N"
while [ "$CONFIRM_CPPLIB_DIR" != "Y" ] && [ "$CONFIRM_CPPLIB_DIR" != "y" ]
do
        echo 'Do you want to use: '$CPPLIB_INSTALL_DIR' as your C++ library install directory?'
        echo '[Y]'
        read CONFIRM_CPPLIB_DIR
        if [ "$CONFIRM_CPPLIB_DIR" != "Y" ] && [ "$CONFIRM_CPPLIB_DIR" != "y" ]
                then
                        echo 'Please provide the desired package install directory.'
                        read CPPLIB_INSTALL_DIR
                        [ -d "$CPPLIB_INSTALL_DIR" ] && CPPLIB_INSTALL_DIR_EXISTS="Y" || CPPLIB_INSTALL_DIR_EXISTS="N"
                        if [ "$CPPLIB_INSTALL_DIR_EXISTS" != "Y" ]
                                then
                                        echo "The directory does not exist."
                                        echo "Do you want us to create "$CPPLIB_INSTALL_DIR"?"
                                        echo "[Y]"
                                        read CONFIRM_CREATE_CPPLIB_DIR
                                        if [ "$CONFIRM_CREATE_CPPLIB_DIR" = "Y" ] || [ "$CONFIRM_CREATE_CPPLIB_DIR" = "Y" ]
                                                then
                                                        mkdir -p $CPPLIB_INSTALL_DIR
                                        fi 
                                else
                                        echo "Directory "$CPPLIB_INSTALL_DIR" already exists."
                        fi
        fi
        [ -d "$CPPLIB_INSTALL_DIR" ] && CPPLIB_INSTALL_DIR_EXISTS="Y" || CPPLIB_INSTALL_DIR_EXISTS="N"
        	if [ "$CPPLIB_INSTALL_DIR_EXISTS" != "Y" ]
                	then
                        	echo "The directory does not exist."
                                echo "Do you want us to create "$CPPLIB_INSTALL_DIR"?"
                                echo "[Y]"
                                read CONFIRM_CREATE_CPPLIB_DIR
                                if [ "$CONFIRM_CREATE_CPPLIB_DIR" = "Y" ] || [ "$CONFIRM_CREATE_CPPLIB_DIR" = "Y" ]
                                	then
                                        	mkdir -p $CPPLIB_INSTALL_DIR
                                fi 
                	else
                		echo "Directory "$CPPLIB_INSTALL_DIR" already exists."
                fi

done

echo "Do you want to install Boost?"
echo "[Y]"
CONFIRM_BOOST="N"
read CONFIRM_BOOST
echo $CONFIRM_BOOST
if [ "$CONFIRM_BOOST" = "Y" ] || [ "$CONFIRM_BOOST" = "y" ]
        then
                BOOST_DWNLD="https://dl.bintray.com/boostorg/release/1.75.0/source/boost_1_75_0_rc1.tar.gz"
                cd $CPPLIB_INSTALL_DIR
                wget $BOOST_DWNLD
                BOOST_FILE=$(basename $BOOST_DWNLD)
                tar -zxvf $BOOST_FILE
                rm  $BOOST_FILE
fi

