const getInstallationsResponse = {
    total_count: 2,
    installations: [
        {
            id: 1,
            account: {
                login: 'github',
                id: 1,
                url: 'https://api.github.com/orgs/github',
                repos_url: 'https://api.github.com/orgs/github/repos',
                events_url: 'https://api.github.com/orgs/github/events',
                hooks_url: 'https://api.github.com/orgs/github/hooks',
                issues_url: 'https://api.github.com/orgs/github/issues',
                members_url:
                    'https://api.github.com/orgs/github/members{/member}',
                public_members_url:
                    'https://api.github.com/orgs/github/public_members{/member}',
                avatar_url: 'https://github.com/images/error/octocat_happy.gif',
                description: 'A great organization',
            },
            access_tokens_url:
                'https://api.github.com/installations/1/access_tokens',
            repositories_url:
                'https://api.github.com/installation/repositories',
            html_url:
                'https://github.com/organizations/github/settings/installations/1',
            app_id: 1,
            target_id: 1,
            target_type: 'Organization',
            permissions: {
                metadata: 'read',
                contents: 'read',
                issues: 'write',
                single_file: 'write',
            },
            events: ['push', 'pull_request'],
            single_file_name: 'config.yml',
        },
        {
            id: 3,
            account: {
                login: 'octocat',
                id: 2,
                avatar_url: 'https://github.com/images/error/octocat_happy.gif',
                gravatar_id: '',
                url: 'https://api.github.com/users/octocat',
                html_url: 'https://github.com/octocat',
                followers_url: 'https://api.github.com/users/octocat/followers',
                following_url:
                    'https://api.github.com/users/octocat/following{/other_user}',
                gists_url:
                    'https://api.github.com/users/octocat/gists{/gist_id}',
                starred_url:
                    'https://api.github.com/users/octocat/starred{/owner}{/repo}',
                subscriptions_url:
                    'https://api.github.com/users/octocat/subscriptions',
                organizations_url: 'https://api.github.com/users/octocat/orgs',
                repos_url: 'https://api.github.com/users/octocat/repos',
                events_url:
                    'https://api.github.com/users/octocat/events{/privacy}',
                received_events_url:
                    'https://api.github.com/users/octocat/received_events',
                type: 'User',
                site_admin: false,
            },
            access_tokens_url:
                'https://api.github.com/installations/1/access_tokens',
            repositories_url:
                'https://api.github.com/installation/repositories',
            html_url:
                'https://github.com/organizations/github/settings/installations/1',
            app_id: 1,
            target_id: 1,
            target_type: 'Organization',
            permissions: {
                metadata: 'read',
                contents: 'read',
                issues: 'write',
                single_file: 'write',
            },
            events: ['push', 'pull_request'],
            single_file_name: 'config.yml',
        },
    ],
}

module.exports = {
    getInstallationsResponse,
}
