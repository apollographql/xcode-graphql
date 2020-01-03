# Apollo Xcode Add-ons

These add-ons add syntax highlighting for GraphQL query document files to Xcode.

## Wait, aren't Xcode plugins dead?

Since Apple started code-signing Xcode with Xcode 9, Xcode plugins are indeed [mostly dead](https://www.imdb.com/title/tt0093779/characters/nm0000345). 

However, there are a few small, limited purposes for which they still work, including recognizing particular file types as tied to particular languages, which is what this plugin allows Xcode to do.

## Installation

**NOTE**: This requires some mucking around with files provided directly by Xcode due to some [changes to undocumented APIs for adding syntax highlighting in Xcode 11](https://github.com/apollographql/xcode-graphql/issues/23). Apple friends, please see FB7321565 for further details. 

This all works as Xcode of 11.3, but be aware that it's a bit more fragile than we'd like it to be. Please file an issue on this repo if it stops working in a new version and we'll investigate. 

### Setup script

If you're running Xcode 11 or higher, the fastest way to install is to `cd` into the directory where this repo has been checked out or downloaded, and run the following command in your terminal:

```
sudo ./setup.sh
```

Particularly if you are running Catalina, you will need to use `sudo` in order to make this work due to changes in the permissions model.

Once the setup script has finished, restart Xcode and click the "Load bundle" button on the permissions dialog that appears in Xcode when it restarts. 

### Manual installation

Due to the aforementioned changes in APIs, manual installation works slightly differently for Xcode 11 and up vs. 10 and lower. 

**Note**: On Catalina you may need to `sudo` to get these commands to work. 

### Xcode 11 and Higher

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

### Versions of Xcode prior to 11

Please note that if you are running Xcode 8 the `Plug-ins` and `Specifications` directories might not exist.

- Copy the `GraphQL.ideplugin` directory to `~/Library/Developer/Xcode/Plug-ins/`:

	```
	cp -r GraphQL.ideplugin ~/Library/Developer/Xcode/Plug-ins/
	```
- Copy the `GraphQL.xclangspec` file to `~/Library/Developer/Xcode/Specifications`:

	```
	cp GraphQL.xclangspec ~/Library/Developer/Xcode/Specifications/
	```
