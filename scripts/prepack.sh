#!/bin/sh

npm install \
&& npm run generate \
&& npm run build \
&& npm run prebuildify -- --platform linux  --arch x64   --libc musl \
&& npm run prebuildify -- --platform linux  --arch arm64 --libc musl \
&& mv prebuilds/linux-x64   prebuilds/linuxmusl-x64 \
&& mv prebuilds/linux-arm64 prebuilds/linuxmusl-arm64 \
&& npm run prebuildify -- --platform linux  --arch x64 \
&& npm run prebuildify -- --platform linux  --arch arm64 \
&& npm run prebuildify -- --platform darwin --arch x64 \
&& npm run prebuildify -- --platform darwin --arch arm64 \
&& npm run prebuildify -- --platform win    --arch x64 \
&& npm run prebuildify -- --platform win    --arch arm64
