local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-linuxtools') {
  settings+: {
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('linuxtools-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.linuxtools') {
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Eclipse plugins integrating Linux technologies - Docker, SystemTap, Kernel Perf, Valgrind, GGov, GProf, Vagrant, RPM, ...",
      has_discussions: true,
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('GITLAB_API_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('LINUXTOOLS_GITLAB_API_TOKEN') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('org.eclipse.linuxtools.eclipse-build') {
      allow_merge_commit: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
}
