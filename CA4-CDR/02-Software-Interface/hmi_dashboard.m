function hmi_dashboard
    fig = uifigure('Name', 'Line Follower HMI - Team 05', 'Position', [100, 100, 750, 550]);
    uilabel(fig, 'Position', [250, 500, 250, 30], 'Text', 'LINE FOLLOWER DIGITAL TWIN', ...
        'FontSize', 16, 'FontWeight', 'bold');
    uilabel(fig, 'Position', [50, 440, 80, 20], 'Text', 'Select Scenario:');
    scenario = uidropdown(fig, 'Position', [150, 440, 150, 25], ...
        'Items', {'S1 - Nominal', 'S2 - Obstacle', 'S3 - Fault'});
    uibutton(fig, 'Position', [150, 400, 100, 30], 'Text', 'RUN', ...
        'ButtonPushedFcn', @(btn,event) disp(['Running: ' scenario.Value]));
end
