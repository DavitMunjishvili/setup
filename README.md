# Personal Setup

This project automates the setup of a new computer, installing essential applications and configuring system settings.

## Supported Operating Systems

-   **macOS**
-   **Linux** (Debian, Fedora, Arch)

## Usage

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/dmunjishvili/setup.git
    cd setup
    ```

2.  **Run the setup script:**

    ```bash
    ./pre.sh
    ```

    The script will perform the following actions:
    - Install the [Fish shell](https://fishshell.com/) if it's not already present.
    - Set Fish as the default shell (with your permission).
    - Automatically launch the main setup script (`run.fish`).

The setup process will then install all the applications and apply the configurations defined in this repository.

## Dry Run

To see which commands would be executed without actually making any changes, you can do a dry run. To do so, pass the `--dry-run` flag to the script:

```bash
./pre.sh --dry-run
```