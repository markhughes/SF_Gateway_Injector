
rm -rf dist
mkdir -p dist

SOURCE_SWF="SF_Gateway.swf"
OUTPUT_SWF="dist/SF_Gateway.swf"
SOURCE_AS="src/NetServiceProxy.as"

echo " > Compiling our SWF file $SOURCE_SWF with $SOURCE_AS ..."

mtasc -swf "$SOURCE_SWF" "$SOURCE_AS" -frame 1 -version 8 -infer -keep -main  -out "$OUTPUT_SWF"

echo " > Done! $OUTPUT_SWF"