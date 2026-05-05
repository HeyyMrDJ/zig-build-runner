const std = @import("std");

pub fn build(b: *std.Build) void {

    // `zig build echo` — run an arbitrary command
    const echo_step = b.step("echo", "Echo a message");
    echo_step.dependOn(&b.addSystemCommand(&.{ "echo", "Hello, world!" }).step);

    // `zig build run-script` — run a shell script
    const run_script_step = b.step("run-script", "Run scripts/hello.sh via bash");
    run_script_step.dependOn(&b.addSystemCommand(&.{ "bash", "scripts/hello.sh" }).step);

    // `zig build run-with-env` — run a command with injected env vars
    const run_env_cmd = b.addSystemCommand(&.{ "printenv", "MY_VAR" });
    run_env_cmd.setEnvironmentVariable("MY_VAR", "hello-from-zig-build");
    const run_env_step = b.step("run-with-env", "Run a command with a custom env var");
    run_env_step.dependOn(&run_env_cmd.step);
}
