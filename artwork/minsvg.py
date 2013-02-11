special_chars = '-mzlhvcsqtaMZLHVCSQTA'

def minpath(d, precision=2):
    'd must be the d attribute of the path'
    for i in special_chars:
        d = d.replace(i, ' {} '.format(i))
    d = d.replace(',', ' ').split()
    temp = []
    for i in d:
        try:
            temp.append(float(i))
        except:
            temp.append(i)
    d, temp = temp, []
    for i in d:
        try:
            temp.append('{:.{precision}f}'.format(i, precision=precision).rstrip('0').rstrip('.'))
        except:
            temp.append(str(i))
    d = ' '.join(temp)
    for i in special_chars:
        d = d.replace(' {}'.format(i), i)
    for i in special_chars:
        d = d.replace('{} '.format(i), i)
    return d