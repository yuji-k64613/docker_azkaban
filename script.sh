#!/bin/bash
grep '^trap' ~/.bashrc > /dev/null
if [ $? -ne 0 ]; then
cat << EOF >> ~/.bashrc
trap 'cd /root/azkaban; ./bin/azkaban-solo-shutdown.sh; exit 0' TERM
EOF
fi
cd /root/azkaban
./bin/azkaban-solo-start.sh 
exec /bin/bash
