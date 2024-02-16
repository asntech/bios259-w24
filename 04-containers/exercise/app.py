import click

@click.command()
@click.option('--name', default='Participant', help='Name of the participant.')
@click.version_option(version='1.0.0')
def main(name):
    """
    Welcome to BIOS259: The Art of Reproducible Science!
    github.com/asntech/art-of-reproducible-science
    
    Author: Aziz Khan <azizk@stanford.edu>
    """
    click.echo(f"Hello, {name}, Welcome to BIOS259 – The Art of Reproducible Science")

if __name__ == "__main__":
    main()
