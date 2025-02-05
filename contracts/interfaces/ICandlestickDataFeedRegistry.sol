// SPDX-License-Identifier: MIT

pragma solidity >=0.7.6;

interface ICandlestickDataFeedRegistry {
    /**
    * @notice Gets the current price of the given asset's data feed.
    * @dev Current price is the 'close' price of the latest candlestick.
    * @dev Price is denominated in USD.
    * @dev Price is scaled to 18 decimals.
    * @dev Returns 0 if the given asset does not have a data feed.
    * @param _asset Address of the asset.
    * @return uint256 The current USD price of the given asset.
    */
    function getCurrentPrice(address _asset) external view returns (uint256);

    /**
    * @notice Gets the current price of the given asset's data feed.
    * @dev Gets the asset address associated with the given symbol and calls getCurrentPrice().
    * @param _symbol Symbol of the asset.
    * @return uint256 The current USD price of the given asset.
    */
    function getCurrentPriceFromSymbol(string memory _symbol) external view returns (uint256);

    /**
    * @notice Gets the price of the given asset's data feed at the given index.
    * @dev Index must come before the current index.
    * @dev Price is denominated in USD.
    * @dev Price is scaled to 18 decimals.
    * @dev Returns 0 if the given asset does not have a data feed.
    * @param _asset Address of the asset.
    * @param _index Index in the data feed's history.
    * @return uint256 The USD price at the given index.
    */
    function getPriceAt(address _asset, uint256 _index) external view returns (uint256);

    /**
    * @notice Gets the price of the given asset's data feed at the given index.
    * @dev Gets the asset address associated with the given symbol and calls getPriceAt().
    * @param _symbol Symbol of the asset.
    * @return uint256 The USD price at the given index.
    */
    function getPriceAtFromSymbol(string memory _symbol, uint256 _index) external view returns (uint256);

    /**
    * @notice Gets the current candlestick of the given asset's data feed.
    * @dev Price is denominated in USD.
    * @dev Price is scaled to 18 decimals.
    * @dev Returns 0 for each value if the given asset does not have a data feed.
    * @param _asset Address of the asset.
    * @return (uint256, uint256, uint256, uint256, uint256, uint256, uint256) The candlestick index, high price, low price, open price, close price, volume, and starting timestamp.
    */
    function getCurrentCandlestick(address _asset) external view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256);

    /**
    * @notice Gets the current candlestick of the given asset's data feed.
    * @dev Gets the asset address associated with the given symbol and calls getCurrentCandlestick().
    * @param _symbol Symbol of the asset.
    * @return (uint256, uint256, uint256, uint256, uint256, uint256, uint256) The candlestick index, high price, low price, open price, close price, volume, and starting timestamp.
    */
    function getCurrentCandlestickFromSymbol(string memory _symbol) external view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256);

    /**
    * @notice Gets the candlestick of the given asset's data feed at the given index.
    * @dev Index must come before the current index.
    * @dev Price is denominated in USD.
    * @dev Price is scaled to 18 decimals.
    * @dev Returns 0 for each value if the given asset does not have a data feed.
    * @param _asset Address of the asset.
    * @param _index Index in the data feed's history.
    * @return (uint256, uint256, uint256, uint256, uint256, uint256, uint256) The candlestick index, high price, low price, open price, close price, volume, and starting timestamp.
    */
    function getCandlestickAt(address _asset, uint256 _index) external view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256);

    /**
    * @notice Gets the candlestick of the given asset's data feed at the given index.
    * @dev Gets the asset address associated with the given symbol and calls getCandlestickAt().
    * @param _symbol Symbol of the asset.
    * @return (uint256, uint256, uint256, uint256, uint256, uint256, uint256) The candlestick index, high price, low price, open price, close price, volume, and starting timestamp.
    */
    function getCandlestickAtFromSymbol(string memory _symbol, uint256 _index) external view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256);

    /**
    * @notice Given the address of an asset, returns the asset's data feed info.
    * @dev Returns 0 or address(0) for each value if the given asset does not have a data feed.
    * @param _asset Address of the asset.
    * @return (address, address, address, uint256, uint256) Address of the data feed, address of the data feed's asset, address of the dedicated data provider, timestamp when the data feed was created, current price.
    */
    function getDataFeedInfo(address _asset) external view returns (address, address, address, uint256, uint256);

    /**
    * @notice Given the address of an asset, returns the asset's data feed info.
    * @dev Gets the asset address associated with the given symbol and calls getDataFeedInfo().
    * @param _symbol Symbol of the asset.
    * @return (address, address, address, uint256, uint256) Address of the data feed, address of the data feed's asset, address of the dedicated data provider, timestamp when the data feed was created, current price.
    */
    function getDataFeedInfoFromSymbol(string memory _symbol) external view returns (address, address, address, uint256, uint256);

    /**
    * @notice Given the address of an asset, returns the address of the asset's data feed.
    * @dev Returns 0 if the given asset does not have a data feed.
    * @param _asset Address of the asset.
    */
    function getDataFeedAddress(address _asset) external view returns (address);

    /**
    * @notice Given the symbol of an asset, returns the address of the asset's data feed.
    * @dev Gets the asset address associated with the given symbol and calls getDataFeedAddress().
    * @param _symbol Symbol of the asset.
    * @return address Address of the asset's data feed.
    */
    function getDataFeedAddressFromSymbol(string memory _symbol) external view returns (address);

    /**
    * @notice Returns the timestamp at which the given asset's data feed was last updated.
    * @dev Returns 0 if the given asset does not have a data feed.
    * @param _asset Address of the asset.
    */
    function lastUpdated(address _asset) external view returns (uint256);

    /**
    * @notice Returns the timestamp at which the given asset's data feed was last updated.
    * @dev Gets the asset address associated with the given symbol and calls lastUpdated().
    * @param _symbol Symbol of the asset.
    * @return uint256 Timestamp at which the data feed was last updated.
    */
    function lastUpdatedFromSymbol(string memory _symbol) external view returns (uint256);

    /**
    * @notice Returns the status of the given asset's data feed.
    * @param _asset Address of the asset.
    */
    function getDataFeedStatus(address _asset) external view returns (uint256);

    /**
    * @notice Given the symbol of an asset, returns the status of the asset's data feed.
    * @dev Gets the asset address associated with the given symbol and calls getDataFeedStatus().
    * @dev 0 = Active.
    * @dev 1 = Outdated.
    * @dev 2 = Halted.
    * @dev 3 = Data feed not found.
    * @param _symbol Symbol of the asset.
    * @return uint256 Status of the given asset's data feed.
    */
    function getDataFeedStatusFromSymbol(string memory _symbol) external view returns (uint256);

    /**
    * @notice Aggregates the given number of candlesticks into one candlestick, representing a higher timeframe.
    * @dev If there are not enough candlesticks in the data feed's history, the function will aggregate all candlesticks in the data feed's history.
    *      Ex) If user wants to aggregate 60 candlesticks but the data feed only has 50 candlesticks, the function will return a candlestick of size 50 instead of 60.
    * @dev It is not recommended to aggregate more than 10 candlesticks due to gas.
    * @dev Returns 0 for each value if the given asset does not have a data feed.
    * @param _asset Address of the asset.
    * @param _numberOfCandlesticks Number of candlesticks to aggregate.
    * @return (uint256, uint256, uint256, uint256, uint256, uint256) High price, low price, open price, close price, total volume, and starting timestamp.
    */
    function aggregateCandlesticks(address _asset, uint256 _numberOfCandlesticks) external view returns (uint256, uint256, uint256, uint256, uint256, uint256);

    /**
    * @notice Aggregates the given number of candlesticks into one candlestick, representing a higher timeframe.
    * @dev Gets the asset address associated with the given symbol and calls aggregateCandlesticks().
    * @param _symbol Symbol of the asset.
    * @return (uint256, uint256, uint256, uint256, uint256, uint256) High price, low price, open price, close price, total volume, and starting timestamp.
    */
    function aggregateCandlesticksFromSymbol(string memory _symbol, uint256 _numberOfCandlesticks) external view returns (uint256, uint256, uint256, uint256, uint256, uint256);

    /**
    * @notice Given the address of an asset, returns whether the asset has a data feed.
    * @param _asset Address of the asset.
    * @return bool Whether the given asset has a data feed.
    */
    function hasDataFeed(address _asset) external view returns (bool);

    /**
    * @notice Given the symbol of an asset, returns whether the asset has a data feed.
    * @param _symbol Symbol of the asset.
    * @return bool Whether the given asset has a data feed.
    */
    function hasDataFeedFromSymbol(string memory _symbol) external view returns (bool);

    /**
    * @notice Registers a new data feed to the platform.
    * @dev Only the contract operator can call this function.
    * @dev Transaction will revert if a data feed already exists for the given asset.
    * @param _asset Address of the asset.
    * @param _symbol Symbol of the asset.
    * @param _dedicatedDataProvider Address of the data provider responsible for this data feed.
    */
    function registerDataFeed(address _asset, string memory _symbol, address _dedicatedDataProvider) external;
}