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

