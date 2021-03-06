# OmniAuth Instagram Basic Display

This is the unofficial OmniAuth strategy for authenticating to Instagram. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret
on the [Facebook Developer website](https://developers.facebook.com/).

## Basic Usage

    use OmniAuth::Builder do
      provider :instagram, 
        ENV['INSTAGRAM_ID'], 
        ENV['INSTAGRAM_SECRET'], 
        scope: 'user_profile,user_media'
    end

## Notes:
- For more information on scopes: https://developers.facebook.com/docs/instagram-basic-display-api/guides/getting-access-tokens-and-permissions

## License

Copyright (c) 2011-2017 Mihai Anca and Intridea, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
