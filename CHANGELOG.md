# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.1] - 2021-12-10
### Added
- A factory bot for setting up objects as test data.
- Adding item class to store information about each item with discount type
- Adding test data for items

### Changed
- Update Checkout spec to use described_class
- New class to calculate discounts 
- Update checkout class to make use Item class and TotalItemCost

### Internal
- Move the checkout_spec file to a lib folder
