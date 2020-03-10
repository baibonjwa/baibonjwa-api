class AppcheckController < ApplicationController
  def appcheck
    result = {}
    result[:status] = 'ok'

    if Rails.env.development?
      result[:current_branch] = `git rev-parse --abbrev-ref HEAD`.chomp
      result[:current_sha] = `git rev-parse --verify HEAD`.chomp
      result[:remote_sha] = `git rev-parse --verify origin/master`.chomp
    else
      result[:current_branch] = `cd ../scm && git rev-parse --abbrev-ref HEAD`.chomp
      result[:current_sha] = `cd ../scm && git rev-parse --verify HEAD`.chomp
      result[:remote_sha] = `cd ../scm && git rev-parse --verify origin/master`.chomp
      deploy_version = `ls ../ -Art | sort -n | tail -n 2 | sed -n '2p'`.chomp
      result[:deploy_version] = Integer(deploy_version, exception: false)
    end
    result[:latest] = result[:current_sha] === result[:remote_sha]

    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end
end
