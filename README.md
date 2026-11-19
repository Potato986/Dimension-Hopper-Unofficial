# Dimension Hopper Unofficial

Unofficial local development project based on Dimension Hopper 1.5.10. This project is not affiliated with or endorsed by the original authors.

## Client packages

`release-candidate/Dimension-Hopper-Unofficial-1.5.10-unofficial.1.zip` is a CurseForge-format import package. In HMCL, use **Add Instance > Import from local file**, select the ZIP, then allow HMCL to download the 373 listed CurseForge mod files. Select Java 8 and allocate about 8 GB RAM. The package targets Minecraft 1.12.2 and Forge 14.23.5.2860. It is an installer package, not an offline game bundle. You confirmed that importing it in HMCL starts successfully.

`release-candidate/Dimension-Hopper-Unofficial-1.5.10-hmcl-instance.zip` is a locally assembled full instance package. You confirmed that it starts successfully in HMCL. Extract it into a dedicated HMCL Minecraft game directory so the ZIP root contents become the `.minecraft` contents. Then add the `Dimension Hopper` version in HMCL. It includes 375 client mods and assets, excludes the launcher, saves, account/session files, logs, and natives.  Java 8 is required. Its 1.5 GB size is too large for a regular GitHub Release asset.

## Development files

`client-pack/manifest.json` and `client-pack/overrides` are the import-pack source. `source/client-mod-inventory.json` records installed client mod filenames and SHA-256 values. `server-reference/server-mod-inventory.json` records server mod filenames. These inventories do not include server mod binaries.

The original CurseForge client lists 373 downloadable projects. The installed client has 375 mod files. The server has 343 mods, all present in the installed client, with 32 additional client-side files.

## Publishing

Commit only source/configuration files and manifests after reviewing their licenses. Upload the CurseForge ZIP as a GitHub Release asset, and upload the SHA-256 file alongside it. Do not upload the HMCL instance ZIP to a normal GitHub Release due to its size. For a truly standalone download, use a file host that permits a 1.5 GB asset and first verify redistribution permissions for every third-party mod and resource.

The upstream repository's license applies only to files covered by that repository. Third-party mods, assets, music, and other content retain their own licenses. The upstream README and GitHub license label have differed, so verify the actual LICENSE file before reusing upstream source. Do not commit launcher programs, credentials, saves, logs, caches, generated natives, or installed third-party mod JARs to the development repository.
