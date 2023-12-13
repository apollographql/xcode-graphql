# Apollo Xcode Add-ons

These add-ons add syntax highlighting for GraphQL query document files to Xcode.

## Wait, aren't Xcode plugins dead?

Since Apple started code-signing Xcode with Xcode 9, Xcode plugins are indeed [mostly dead](https://www.imdb.com/title/tt0093779/characters/nm0000345). 

However, there are a few small, limited purposes for which they still work, including recognizing particular file types as tied to particular languages, which is what this plugin allows Xcode to do.

## Installation via script

The fastest way to install is to `cd` into the directory where this repo has been checked out or downloaded, and run one of the included install scripts.

Once the setup script has finished, restart Xcode and click the "Load bundle" button on the permissions dialog that appears in Xcode when it restarts. 

### Anything other than Xcode 11

The script to run for versions of Xcode other than 11.x is `setup.sh`: 

```
./setup.sh
```

### Xcode 11

> **NOTE**: This requires some mucking around with files provided directly by Xcode due to some [bugs for adding syntax highlighting in Xcode 11](https://github.com/apollographql/xcode-graphql/issues/23). These issues are addressed as of Xcode 12 beta 2. 
>
> This all works as Xcode of 11.5, but be aware that it's a bit more fragile than we'd like it to be. Please file an issue on this repo if it stops working in a new version and we'll investigate. 

The script to run for versions of Xcode other than 11.x is `setup.sh`: 

```
sudo ./setup-xcode11.sh
```

Particularly if you are running Catalina, **you will need to use `sudo`** in order to make this work due to changes in the permissions model.


## Manual installation

Due to the aforementioned broken APIs, manual installation works slightly differently for Xcode 11 vs. other versions. 

### Anything other than Xcode 11

Please note that the `Plug-ins` and `Specifications` directories might not exist, and if they don't, you'll need to create them.

- Copy the `GraphQL.ideplugin` directory to `~/Library/Developer/Xcode/Plug-ins/`:

	```
	cp -r GraphQL.ideplugin ~/Library/Developer/Xcode/Plug-ins/
	```
- Copy the `GraphQL.xclangspec` file to `~/Library/Developer/Xcode/Specifications`:

	```
	cp GraphQL.xclangspec ~/Library/Developer/Xcode/Specifications/
	```


### Xcode 11

**Note**: On Catalina you will need to `sudo` to get these commands to work. 

- Copy the `GraphQL.ideplugin` directory to `~/Library/Developer/Xcode/Plug-ins/`:

	```
	cp -r GraphQL.ideplugin ~/Library/Developer/Xcode/Plug-ins/
	```
- Copy the `GraphQL.xclangspec` file to `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications`:

	```
	cp GraphQL.xclangspec /Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications
	```

- Copy the `Xcode.SourceCodeLanguage.GraphQL.plist` file to `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata`:

```
cp Xcode.SourceCodeLanguage.GraphQL.plist /Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata
```

## How to update this plugin for new versions of Xcode

1. Install the new version of Xcode. 
2. Get the UUID of the version using the following command in Terminal: 
    
    `defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID`
    
    or, for beta versions,
    
    `defaults read /Applications/Xcode-beta.app/Contents/Info DVTPlugInCompatibilityUUID`
3. Copy the UUID. 
4. Paste the UUID into the list of `DVTPlugInCompatibilityUUIDs` in `Graphql.ideplugin/Contents/Info.plist`. Do not remove any old IDs, just add the new one. 
5. Reinstall the plugin using whatever method you were using above. You will need to restart Xcode to validate that your changes worked. 
6. If it worked, submit a pull request with this change. If it didn't work, please file an issue. 
   
Note that most UUIDs change from the beta to the final version, so we do not recommend adding UUIDs for betas except during "beta season" of an upcoming major release. 