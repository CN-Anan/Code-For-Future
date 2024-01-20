use std::process::Command;

fn main() {
    let mut output = Command::new("cmd")
        .arg("/C")
        .arg("pip")
        .arg("list")
        .output()
        .expect("failed to execute process");

    let result = String::from_utf8(output.stdout).expect("error");
    let mut lines: Vec<&str> = result.split('\n').skip(2).collect::<Vec<&str>>();
    lines.pop();
    for line in lines {
        if !(line.starts_with("pip") || line.starts_with("setuptools")) {
            println!("uninstall [{}]", line.trim());
            let pkg_name = line.split_whitespace().collect::<Vec<&str>>()[0];

            output = Command::new("cmd")
                .arg("/C")
                .arg("@echo")
                .arg("y")
                .arg("|")
                .arg("pip")
                .arg("uninstall")
                .arg(pkg_name)
                .output()
                .expect("failed to execute process");
            let result_out = String::from_utf8(output.stdout).expect("error");
            println!("{}", result_out)
        }
    }
    let mut tmp = String::new();
    let _ = std::io::stdin().read_line(&mut tmp);
}
