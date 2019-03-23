# RepoMan

Bulk delete GitHub repositories.

##

* Clone this repository

* Generate a GitHub auth [token](https://github.com/settings/tokens/new) with `delete_repo` permissions.

* Save the token in a file called `token.txt` in the root of the project.

    #### `token.txt`
    ```
    xxxxx_your_token_xxxxxx
    ```
* Save a list of the repository names or URLs you want to delete in a file called `repos.txt` in the root of the project. Try opening each repo you want to delete in a new tab and use [OneTab](https://chrome.google.com/webstore/detail/onetab/chphlpgkkbolifaimnlloiipkdnihall) to consolidate them and export to a list.

    #### `repos.txt`
    ```
    username/repo1
    username/repo2
    username/repo3
    https://github.com/username/repo4 | Description of your repo
    etc...
    ```
* Run the application with `mix run --no-halt`
