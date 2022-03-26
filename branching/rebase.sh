#!/bin/bash
# display command line options

#!/bin/bash
# display command line options

count=1
for param in "$@"; do
    echo "\$@ Parameter #$count = $param"
=======
for param in "$*"; do
    echo "\$* Next parameter #$count = $param"
>>>>>>> bad665d (git rebase 2)
    count=$(( $count + 1 ))
done

echo "====="
