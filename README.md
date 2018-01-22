# gh\_escalate

A script that uses the [GitHub API](https://developer.github.com/v3/) to look for issues with specific labels in  a repository, and generates notifications based on the age and the last activity of the issue.

This repository provides a script `bin/gh_escalate` which should be executed on a daily basis.

## Configuratio

Three files are required to be present in the `$PWD` from where the script is invoked:

* `policies.yaml`
* `targets.yaml`
* `config.yaml`

**`policies.yaml`**

YAML document where the keys are labels, and the values are an array of policies. Each policy may have:

* `:since`: Runs only if current time is after creation time + `:since` in days
* `:until`: Runs only if current time is before creation time + `:until` in days
* `:last_activity`: Runs only if current time is after updated_time + `:last_activity` in days
* `:target`: Array of notification targets

Example:

```yaml
SEV1:
  - :since: 2
    :until: 5
    :targets:
      - XX
  - :since: 5
    :targets:
      - XX
      - BOSS

SEV2:
  - :since: 2
    :until: 5
    :last_activity: 2
    :targets:
      - YY
  - :since: 5
    :last_activity: 2
    :targets:
      - YY
      - BOSS
```

**`targets.yaml`**

YAML document where the keys are target names, and the values are an array of targets. Each target should have a `:provider` and `:args`. The value of `:args` depends on the provider. Currently the only provider supported is `:email`.

Example:

```yaml
XX:
  - :provider: :email
    :args: xx@test.com
YY:
  - :provider: :email
    :args: yy1@test.com

  - :provider: :email
    :args: yy2@test.com
```

**`config.yaml`**

Currently two configuration parameters must be specified:

* `:repo`: The repository to watch.
* `:token`: The GitHub token.

These two parameters (and the entire `config.yaml`) may be omitted if `GHESCALATE_GH_REPO` and `GHESCALATE_GH_TOKEN` environment variables are provided.

## Usage

Once the configuration files are present, the script may be executed:

```bash
bundle install
bundle exec bin/gh_escalate
```
