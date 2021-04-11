# save a procedurally generated background

# aliased to save-bg

# include aliases
shopt -s expand_aliases
source ~/.bashrc

# move into the triangle directory
background_directory

# get the color of the background as the parameter
color=$1

cd saved

# check if the directory exists, if not create it
if [ ! -d "./$color" ] ; then
    mkdir $color
    echo "0" > $color/count.txt
fi

cd $color

# read the count from the count file
read count < count.txt

# copy the current image to the correct saved directory
cp ../../out.png ./$count.png

# increment the count
count=$((count + 1))

# save the incremented count to the count file
echo $count > count.txt
