import time

from django.core.management.base import BaseCommand
from django.db.utils import OperationalError
from psycopg2 import OperationalError as PsycopError


class Command(BaseCommand):

    def handle(self, *args, **options):
        self.stdout.write('Waiting for database to start')
        db_up = False
        while db_up is False:
            try:
                self.check(databases=["default"])
                db_up = True
            except (PsycopError, OperationalError):
                self.stdout.write('DB unavailable, waiting')
                time.sleep(1)

        self.stdout.write(self.style.SUCCESS('Ready!'))
