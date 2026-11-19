# Dimension Hopper Unofficial

An independent, unofficial community continuation based on Dimension Hopper 1.5.10. Maintained by Potato986 and not affiliated with or endorsed by the original authors.

## Compatibility

- Minecraft 1.12.2
- Forge 14.23.5.2860
- Java 8
- Recommended memory: 8 GB

The CurseForge-format client package was imported into HMCL and confirmed to start successfully in the maintainer's environment. It requires an internet connection to download the 373 mod files listed in `client-pack/manifest.json`.

## Repository contents

This clone currently contains the CurseForge manifest and mod list, client and server mod inventories, and server configuration references. It does not currently contain `client-pack/overrides` or the generated release archives. The locally tested HMCL package is therefore not reproducible from this clone yet. Add the required configuration, scripts, and resources before building a new client release.

See [PACKAGING.md](PACKAGING.md) for the client archive build and validation command. The script refuses to build until the approved `client-pack/overrides` files are present.

The installed client contains 375 mod files. The server inventory contains 343 mods, all present in the client inventory, with 32 additional client-side mods.

## Unofficial releases

This project publishes its own unofficial releases from the `Potato986/Dimension-Hopper-Unofficial` repository. It does not submit maintenance pull requests to the original repository.

Before publishing a package, include the required overrides, verify that the resulting archive imports and starts in a clean HMCL instance, and review redistribution permissions for included files. The original repository's license applies only to files covered by that license. Third-party mods, images, audio, and other assets keep their own licensing terms. Do not imply endorsement by the original authors.

Do not commit launcher executables, account/session data, local saves, logs, caches, generated natives, or installed third-party mod JARs to the source repository.
