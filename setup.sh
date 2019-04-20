# let's create our bash dot files and route correctly
BASH_PROFILE=~/.bash_profile
BASHRC=~/.bashrc
PROFILE=~/.profile
# create .bash_profile if it does not exist
if ! [ -f $BASH_PROFILE ]; then
    touch $BASH_PROFILE
    chmod 700 $BASH_PROFILE
fi
# load .profile then .bashrc from .bash_profile
echo "[ -r $PROFILE ] && . $PROFILE" >> $BASH_PROFILE
# create .profile if it does not exist
echo "[ -r $BASHRC ] && . $BASHRC" >> $BASH_PROFILE
if ! [ -f $PROFILE ]; then
    touch $PROFILE
    chmod 700 $PROFILE
fi
# create .bashrc if it does not exist
if ! [ -f $BASHRC ]; then
    touch $BASHRC
    chmod 700 $BASHRC
fi
cat >> $PROFILE <<'zzzz'
# create environment variable for cpputest
export CPPUTEST_HOME="/Users/temp/Tools/cpputest" >> $PROFILE
# add Nordic semi tools to path
export PATH="${PATH}:/Users/temp/Tools/nRF5x-Command-Line-Tools_9_7_3_OSX/nrfjprog" >> $PROFILE
# add ARM toolchain to path
export PATH="${PATH}:/Users/temp/Tools/gcc-arm-none-eabi-7-2017-q4-major/bin" >> $PROFILE
# add Python 3.7 to path, the original version is saved in .bash_profile.pysave
export PATH="${PATH}:/Library/Frameworks/Python.framework/Versions/3.7/bin" >> $PROFILE
# add MacPorts Installer addition on 2018-07-10_at_12:37:23: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:${PATH}" >> $PROFILE
# add microchip to path
#export PATH="$PATH:/Applications/microchip/xc8/v2.00/bin"
zzzz

# special for python, add the homebrew version into path
#echo 'export PATH="/usr/local/opt/python/libexec/bin:$PATH"' >> $BASHRC
# test it
#source $BASHRC
#BREW_PYTHON="$(command -v python)"
#echo $BREW_PYTHON
#python --version
