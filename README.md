Flex Version Manager API
========================

About
-----

The Flex Version Manager API was built to support (and use) the [FVM][fvm] project. This
site provides a public endpoint to retrieve build information about the [Adobe Open Source Flex SDK][flex].

Currently the API provides only information about builds currently available for download
from the SDK homepage. This means that you can find accurate information about Flex SDK versions
**3**, **4**, and **Hero**.

Information about each build includes:

- The build's version number

- The SDK version it belongs to

- The build date

- The build description (Nightly, Stable, Preview, etc.)

- The URL to the build's download page

- The build's milestone notes, if any

Usage
-----

The full collection of builds can be retrieved at the endpoint:

`GET /builds.(json|xml)`

This collection can currently be filtered by SDK name or by specific version number 
through query string params, like:

`GET /builds.json?sdk=(3|4|Hero)`
  
`GET /builds.json?version=4.5.0.17689`


[fvm]: https://github.com/SFCRD/fvm "Flex Version Manager GitHub Repository"
[flex]: http://opensource.adobe.com/wiki/display/flexsdk/Flex+SDK "Adobe Open Source Flex SDK"