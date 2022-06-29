const { webpackConfig, merge } = require('shakapacker');
const webpack = require('webpack');

const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const RemoveEmptyScriptsPlugin = require('webpack-remove-empty-scripts');;

// See the shakacode/shakapacker README and docs directory for advice on customizing your webpackConfig.
const customConfig = {
  resolve: {
    extensions: ['.js', '.jsx', '.scss', '.css'],
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: ['babel-loader'],
      },
      {
        test: /\.s[ac]ss$/i,
        use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader', 'postcss-loader'],
      },
    ],
  },
  plugins: [
    new RemoveEmptyScriptsPlugin(),
    new MiniCssExtractPlugin(),
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      jquery: 'jquery',
      Popper: ['popper.js', 'default']
    })
  ],
}

module.exports = merge(webpackConfig, customConfig)
