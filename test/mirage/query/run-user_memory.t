  $ export MIRAGE_DEFAULT_TARGET unix

An hvt image links at text_start and declares its user memory in the manifest
  $ ./config_user_memory.exe query --target hvt dune.build | grep link_flags
   (link_flags :standard -w -70 -cclib "-z solo5-abi=hvt" -cclib "-z solo5-text-start=0xc0000000")
  $ ./config_user_memory.exe configure --target hvt
  Successfully configured the unikernel. Now run 'make' (or more fine-grained steps: 'make all', 'make depends', or 'make lock').
  $ cat mirage/manifest.json
  {
    "type": "solo5.manifest",
    "version": 1,
    "devices": [ { "name": "guest", "type": "USER_MEMORY", "size": 3218079744, "address": 2097152 }, { "name": "scratch", "type": "USER_MEMORY", "size": 16777216 } ]
  }

Other targets have no user memory
  $ ./config_user_memory.exe configure --target unix
  user_memory and text_start are for the hvt target only (mirage configure -t hvt)
  [1]

User memory sizes are multiples of 64 KiB
  $ ./config_user_memory_bad.exe configure --target hvt
  user memory "guest": its size and address must be positive multiples of 0x10000 (64 KiB)
  [1]
