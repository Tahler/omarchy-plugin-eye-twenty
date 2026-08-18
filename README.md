# omarchy-plugin-eye-twenty

An Omarchy shell plugin that helps follow the [20-20-20 rule](https://www.aoa.org/AOA/Images/Patients/Eye%20Conditions/20-20-20-rule.pdfhttps://www.aoa.org/AOA/Images/Patients/Eye%20Conditions/20-20-20-rule.pdf). When active, it sends a notification every 20 minutes to remind you to look at an object 20 feet away for 20 seconds.

## Install

```sh
omarchy plugin add https://github.com/Tahler/omarchy-plugin-eye-twenty.git --enable
```

The eye icon appears in the top-right bar section. Click it to pause or resume reminders. The setting persists across shell restarts, and resuming starts a fresh 20-minute interval.

## Uninstall

```sh
omarchy plugin remove io.github.tahler.eye-twenty
```

## Dependencies

No external dependencies.
