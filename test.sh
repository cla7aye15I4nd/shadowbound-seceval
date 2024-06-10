#!/bin/bash

check() { cd /$1; defend=0; for i in {1..5}; do bash -c "$2 2>/dev/null 1>/dev/null" 2>/dev/null 1>/dev/null; [ $? -ne 139 ] && defend=1; done; [ $defend -eq 1 ] && echo -e "\033[32m[+] $1\033[0m" || echo -e "\033[31m[x] $1\033[0m"; }

export USE_ZEND_ALLOC=0

check "2017-9164-9166" "autotrace-0.31.1/autotrace HEAP-color.c-16-11.BMP"
check "2017-9167-9173" "autotrace-0.31.1/autotrace HEAP-input-bmp.c-337-25.BMP"
check "CVE-2006-6563" "proftpd-1.3.0a/proftpd -n && perl 3330.pl /usr/local/var/proftpd/proftpd.sock 1 && perl 3333.pl /usr/local/var/proftpd/proftpd.sock 1"
check "CVE-2009-2285" "tiff-3.8.2/tools/tiff2ps wololo.tif"
check "CVE-2013-4243" "tiff-4.0.1/tools/gif2tiff poc.gif poc.tif"
check "CVE-2013-7443" "sqlite/sqlite3 < poc"
check "CVE-2014-1912" "Python-3.1.5/python poc1.py"
check "CVE-2015-8668" "tiff-4.0.1/tools/bmp2tiff ./libtiff-poc.bmp out.tif"
check "CVE-2015-9101" "lame-398/frontend/lame -f -V 9 ./CVE-2015-9101_3.98 /dev/null"
check "CVE-2016-10270" "libtiff/tools//tiffsplit test049"
check "CVE-2016-10271" "libtiff/tools//tiffcrop -i ./00100-libtiff-heapoverflow-_TIFFFax3fillruns /tmp/foo"
check "CVE-2016-1762" "libxml2/xmllint attachment_320476"
check "CVE-2016-1838" "libxml2/xmllint attachment_316157"
check "CVE-2017-7263" "potrace-1.2/src/potrace 00210-potrace-heapoverflow-bm_readbody_bmp"
check "CVE-2018-20330" "libjpeg-turbo/build/tjbench LAND3.BMP 90"
check "CVE-2019-10872" "poppler/build/utils/pdftoppm -cropbox -mono poc"
check "CVE-2019-7310" "poppler/build/utils/pdfinfo poc"
check "CVE-2019-9021" "php-src/sapi/cli/php -r \"var_dump(new Phar(file_get_contents('./poc.phar'),0,'test.phar'));\""
check "CVE-2019-9200" "poppler/build/utils/pdfimages  -f 1 -l 1 -opw testing -upw testing -j -p -q poc ./out"
check "CVE-2020-15888" "lua/lua poc.lua"
check "CVE-2020-19131" "libtiff/tools/tiffcrop -I data poc.tiff out.tiff"
check "CVE-2020-19144" "libtiff/tools/tiffcp -i poc /dev/null"
check "CVE-2020-21595" "libde265/dec265/dec265 libde265-mc_luma-heap_overflow.crash"
check "CVE-2020-21598" "libde265/dec265/dec265 libde265-ff_hevc_put_unweighted_pred_8_sse-heap_overflow.crash"
check "CVE-2021-26259" "htmldoc/htmldoc/htmldoc -f htmldoc/demo.pdf htmldoc/poc7.html"
check "CVE-2021-3156"  "exp/exp"
check "CVE-2021-32281" "gravity/gravity  -o /tmp/grav -q -c heap-overflow-gnode_function_add_upvalue-gravity_ast-90"
check "CVE-2021-4214"  "libpng/pngimage input"
check "CVE-2022-0080"  "mruby/bin/mirb test.rb"
check "CVE-2022-0891"  "libtiff/tools/tiffcrop -i -E l -H 10 -V 10 -S 8:4 -R 270 poc.tif a.tif"
check "CVE-2022-0924"  "libtiff/tools/tiffcp  -i -s -p separate poc /tmp/foo"
check "CVE-2022-28966" "wasm3/build/wasm3 --func fib poc.wasm"
check "CVE-2022-31627" "php-src/sapi/cli/php poc.php"

## https://huntr.dev/bounties/4458e0b9-0ad3-4036-a032-1b3c4705b889/
## Heap-based Buffer Overflow => NULL Pointer Dereference
## check "mruby-issue-5551" "mruby/bin/mruby poc.rb"
