import yaml
document2 = """
  a: 1
  b:
    c: 3
    d: 4
"""
document ="""
-  first
- second
"""
print yaml.dump(yaml.load(document))
