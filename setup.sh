#!/usr/bin/bash

# extract users
sed -ne '/[^:]*:1[0-9]\{3\}:/p' /etc/passwd

