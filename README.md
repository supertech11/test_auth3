# **URL AUTH WEB**

This is a flutter plugin that simplifies the auth process for OAUTH2 implementations on flutter web

## Step one

First step in using this plugin is to call the plugin to open the authentication URL

```dart
  await UrlAuthWeb().launch(url)
  // features can be passed as a string to configure the window behaviour

  // name can alse be passed to handle browser behavours
```

[Find all parameters here](https://developer.mozilla.org/en-US/docs/Web/API/Window/open)

---

## Step two (optional)

---

You need to create a file in web/auth.html having your server redirect to this page.
set the content of this file to

```html
<!DOCTYPE html>
<title>Authentication complete</title>
<p>
  Authentication is complete. If this does not happen automatically, please
  close the window.
  <script>
    const url = new URL(window.location.href);
    const code = url.searchParams.get("jwt");
    const redirectUrl = new URL(`${url.origin}`);
    const page = "#/auth";
    window.location = `${redirectUrl.href}${page}?jwt=${code}`;
    // set the text of page equal to a path to a page in your app
  </script>
</p>

N/B: You can ignore this step and configure the redirect from your server
```

---

## Step 3

---

In your auth page fetch the query parameters and handle it as you please

```dart
await UrlAuthWeb().getQueryParams();
/*This method returns the queryParameters as a Map<String, dynamic> e.g
{
    'jwt': {{jwt}}
}
*/
```
