#!/bin/bash

timestamp=$(date '+%Y-%m-%d %H:%M:%S')
memory_usage=$(free | grep Mem | awk '{printf("%.2f%", $3/$2 * 100)}')
memory_total=$(free | grep Mem | awk '{printf ("%d MB", $2 / 1024)}')
memory_ava=$(free | grep Mem | awk '{printf ("%d MB", $4 / 1024)}')

echo "[$timestamp] - Fragment Usage [$memory_usage] - Fragment Count [Total: $memory_total, Available: $memory_ava]" 

