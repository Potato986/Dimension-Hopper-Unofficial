# Packaging

The repository's CurseForge manifest references mod downloads by project and file ID. Build an import ZIP after restoring the approved `overrides` files from the maintainer's working copy.

```powershell
./pack-client.ps1 -OutputPath ./release-candidate/Dimension-Hopper-Unofficial.zip
```

The script requires `client-pack/manifest.json`, `client-pack/modlist.html`, and `client-pack/overrides`. It validates the archive root and rejects launcher executables, native DLLs, and mod JARs. The resulting package still needs to be imported into a clean HMCL profile and launched before release.

Do not add locally installed mod JARs to the source repository. Check redistribution permissions for every override asset before publishing the generated ZIP.

For a release, attach the generated ZIP to a GitHub Release and include its SHA-256 value in the release notes or a checksum file. Keep generated archives out of Git history.
