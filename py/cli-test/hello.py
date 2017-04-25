import click

@click.command()
@click.option('--verbose', is_flag=True, help="Will print verbose messages.")
def cli(verbose):
    if verbose:
        click.echo("Hello World in verbose mode")
    else:
        click.echo("Hello not verbose")
