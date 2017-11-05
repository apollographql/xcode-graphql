# Apollo Xcode Add-ons

These add-ons add syntax highlighting for GraphQL query document files to Xcode.

## Installation

### Setup script

Run the following command in your terminal:

```
./setup.sh
```

### Manual installation

Please note that if you are running Xcode 8 the `Plug-ins` and `Specifications` directories might not exist.

- Copy the `GraphQL.ideplugin` directory to `~/Library/Developer/Xcode/Plug-ins/`:

	```
	cp -r GraphQL.ideplugin ~/Library/Developer/Xcode/Plug-ins/
	```
- Copy the `GraphQL.xclangspec` file to `~/Library/Developer/Xcode/Specifications`:

	```
	cp GraphQL.xclangspec ~/Library/Developer/Xcode/Specifications/
	```
