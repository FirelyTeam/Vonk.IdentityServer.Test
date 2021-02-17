# Identity Provider for testing Vonk access control

[Vonk FHIR Server](http://vonk.furore.com) provides access control features based on SMART on FHIR scopes and launch context. Because online available Open ID Connect providers do not provide these claims, we provide you with a simple in-memory Identity Provider that **can** provide these claims.

For instructions on how to use this and the access control features to use it for, see the Vonk documentation:

- [Vonk FHIR Server Access Control](http://docs.simplifier.net/vonk/features/accesscontrol.html)
- [Usage of this Identity Provider](http://docs.simplifier.net/vonk/deployment/identityprovider.html)

|Master|
|---|
|[![Build Status](https://firely.visualstudio.com/Vonk.IdentityServer.Test/_apis/build/status/FirelyTeam.Vonk.IdentityServer.Test?branchName=master)](https://firely.visualstudio.com/Vonk.IdentityServer.Test/_build/latest?definitionId=27&branchName=master)|

## Dependencies

- Microsoft .NET Core 2.2
- [.NET FHIR API](https://github.com/ewoutkramer/fhir-net-api)

The Identity Provider runs with preconfigured values in memory, so it has no database dependencies.

## Thank you

This Identity Provider is built on top [IdentityServer4](https://github.com/IdentityServer/IdentityServer4), an excellent project to get started with Open ID Connect.
