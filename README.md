Deploying a single module

    cd into the module's folder (e.g. cd dev/us-east-1/dev/networking).
    Run terragrunt plan to see the changes you're about to apply.
    If the plan looks good, run terragrunt apply.

Deploying all modules in a region

    cd into the region folder (e.g. cd dev/us-east-1).
    Run terragrunt plan-all to see all the changes you're about to apply.
    If the plan looks good, run terragrunt apply-all.
