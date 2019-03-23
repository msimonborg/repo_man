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
* Save a list of the repositories you want to delete in a file called `repos.txt` in the root of the project.

    #### `repos.txt`
    ```
    username/repo1
    username/repo2
    username/repo3
    etc...
    ```
* Run the application with `mix run --no-halt`

