#!/bin/bash
# join.sh

File: 1.data
100 Shoes
200 Laces
300 Socks 

File: 2.data
100 $40.00
200 $1.00
300 $2.00
join 1.data 2.data
File:1.data 2.data

100 Shoes $40.00
200 Laces $1.00
300 Socks $2.00
