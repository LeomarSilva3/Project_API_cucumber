
at_exit do
    time = Time.now.getutc
    ReportBuilder.configure do |config|
    config.json_path = 'log/report.json'
    config.report_path = 'log/cucumber_api_report'
    config.report_types = [:html]
    config.report_tabs = %w[Overview Features Scenarios Errors]
    config.report_title = 'Cucumber Report Builder web automation test results'
    config.compress_images = false
    config.additional_info = { 'Project name' => 'Test', 'Platform' => 'Integration', 'Report generated' => time }
    end
    ReportBuilder.build_report
end
