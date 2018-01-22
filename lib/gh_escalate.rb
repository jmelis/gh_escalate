require 'gh_escalate/gh_issues'
require 'gh_escalate/policy'
require 'gh_escalate/policy_list'
require 'gh_escalate/notifier'
require 'gh_escalate/provider'
require 'gh_escalate/providers/provider_email'

def run_gh_escalate(gh_issues, policy_list, notifier)
  policy_list.each do |label, pols|
    issues = gh_issues.search(label)
    issues.each do |issue|
      pols.each do |pol|
        if pol.check(issue)
          pol.targets.each do |target|
            notifier.notify(target, issue[:title])
          end
        end
      end
    end
  end
end
