# SF_Gateway Injector

Small WIP and POC of injecting into SF_Gateway using [mtasc](https://github.com/markhughes/mtasc).

Use git-bash if on Windows, or Linux and Mac uses can just execute ./build.sh directly.

The idea here is to avoid AMF messages by overriding the functions in the SWF.

## Usage

Modify src/NetServiceProxy.as as required.

Execute build.sh

Injected actionscript can be found in dist/SF_Gateway.swf
