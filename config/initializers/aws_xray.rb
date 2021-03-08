# frozen_string_literal: true
Rails.application.config.xray = {
  name: 'treatment-database',
  patch: %I[net_http aws_sdk],
  plugins: %I[ec2 elastic_beanstalk],
  # record db transactions as subsegments
  active_record: true,
  context_missing: 'LOG_ERROR'
}
