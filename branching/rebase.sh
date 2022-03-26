#!/bin/bash
# display command line options

#!/bin/bash
# display command line options

count=1
for param in "$*"; do
    echo "\$* Next parameter #$count = $param"
    count=$(( $count + 1 ))
done
o
echo "====="
