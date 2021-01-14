#!/bin/bash

# Locate this script at your kafka client root directory 

#Your ZookeeperConnectString
ZK=YourZookeeperConnectString

ALL_TOPICS=$(./bin/kafka-topics.sh --zookeeper $ZK --list )

for TOPIC in $ALL_TOPICS
do
	# Add more restrictions as you wish
 	if [ "$TOPIC" != "__consumer_offsets" ]; then
		./bin/kafka-topics.sh --zookeeper $ZK --delete --topic $TOPIC
	fi
done
